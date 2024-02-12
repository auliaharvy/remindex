<?php

namespace App\Livewire;

use Modules\Document\Models\Document;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;

class MultiStepForm extends Component
{
    use WithFileUploads;

    public $id_document_type;
    public $id_department;
    public $id_owner_document;
    public $id_primary_contact;
    public $name;
    public $file;
    public $location;
    public $is_expired;
    public $schedule_timestamp;
    public $schedule_date;
    public $schedule_time;
    public $reminder_day;
    public $reminder_repeat;
    public $reminder_interval;

    public $totalSteps = 2;
    public $currentStep = 1;


    public function mount(){
        $this->currentStep = 1;
    }


    public function render()
    {
        return view('livewire.document-form');
    }

    public function increaseStep(){
        $this->resetErrorBag();
        $this->validateData();
         $this->currentStep++;
         if($this->currentStep > $this->totalSteps){
             $this->currentStep = $this->totalSteps;
         }
    }

    public function decreaseStep(){
        $this->resetErrorBag();
        $this->currentStep--;
        if($this->currentStep < 1){
            $this->currentStep = 1;
        }
    }

    public function validateDataDocument(){

        if($this->currentStep == 1){
            $this->validate([
                'first_name'=>'required|string',
                'last_name'=>'required|string',
                'gender'=>'required',
                'age'=>'required|digits:2',
                'file'=>'mimes:doc,docx,pdf,jpeg,png|max:2048',
            ]);
        }
    }

    public function addDocument(){
          $this->resetErrorBag();
          if($this->currentStep == 2){
              $this->validate([
                  'file'=>'required|mimes:doc,docx,pdf,jpeg,png|max:2048',
              ]);
          }

          $file_name = 'File_'.time().$this->file->getClientOriginalName();
          $upload_file = $this->file->storeAs('document_files', $file_name);

          if($upload_file){
              $values = array(
                  "first_name"=>$this->first_name,
                  "last_name"=>$this->last_name,
                  "gender"=>$this->gender,
                  "email"=>$this->email,
                  "phone"=>$this->phone,
                  "country"=>$this->country,
                  "city"=>$this->city,
                  "frameworks"=>json_encode($this->frameworks),
                  "description"=>$this->description,
                  "cv"=>$cv_name,
              );
            DB::beginTransaction();
            Document::insert($values);
              
            //   $this->reset();
            //   $this->currentStep = 1;
            $data = ['name'=>$this->first_name.' '.$this->last_name,'email'=>$this->email];
            return redirect()->route('registration.success', $data);
          }
    }
}
