<?php
            $field_name = 'The Document Have Expiration Date?';
            $field_lable = label_case("$field_name");
            ?>
            {{ html()->label($field_lable, $field_name)->class('form-label') }}
       </div>
<div class="col-12 ">
    <div>
<input type="hidden" id="test6" value="no" ng-model="isFull" checked>
<input type="checkbox" id="test6" value="yes" ng-model="isFull">
<label for="test6">Yes</label>
</div>
<div class="col-6 ">
<div>
<input type="hidden" id="test7" value="no">
<input type="checkbox" id="test7" value="yes">
<label for="test7">No</label>
</div>

<div class="row">
<div class=" col-4 col-sm-12 mb-12">
        <div class="form-group">
            <?php
            $field_name = 'document type';
            $field_lable = label_case("$field_name");
            $field_placeholder = __("Select an option");
            $required = "required";
            $select_options = [
                'Article' => 'Article',
                'Feature' => 'Feature',
                'News' => 'News',
            ];
            ?>
            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
            {{ html()->select($field_name, $select_options)->placeholder($field_placeholder)->class('form-select')->attributes(["$required"]) }}
        </div>
    </div>
    <div class="col-12 col-sm-12 mb-12">
        <div class="form-group">
            <?php
            $field_name = 'Primary Contect';
            $field_lable = label_case($field_name);
            $field_placeholder = "Pilihan";
            $required = "required";
            $select_options = [
                '1'=>'Fauzan',
                '0'=>'Ali'
            ];
            ?>
            {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
            {{ html()->select($field_name, $select_options)->placeholder($field_placeholder)->class('form-control select2')->attributes(["$required"]) }}
        </div>
    </div>
    <div class="col-12 col-sm-12 mb-12">
        <div class="form-group">
            <?php
            $field_name = 'Owner';
            $field_lable = label_case($field_name);
            $field_placeholder = $field_lable;
            $required = "";
            ?>
            {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
            {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
        </div>
    </div>
    <div class="col-12 col-sm-12 mb-12">
        <div class="form-group">
            <?php
            $field_name = 'Departement';
            $field_lable = label_case($field_name);
            $field_placeholder = $field_lable;
            $required = "";
            ?>
            {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
            {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
        </div>
    </div>
    <div class="row mb-3">
    <div class="col-8">
        <div class="form-group">
            <?php
            $field_name = 'Upload dokumen';
            $field_lable = label_case($field_name);
            $field_placeholder = $field_lable;
            $required = "";
            ?>
            {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
            {{ html()->input("file", $field_name)->class('form-control')->attributes(["$required"]) }}
        </div>
    </div>

    @if($data && $data->getMedia($module_name)->first())
    <div class="col-4">
        <div class="float-end">
            <figure class="figure">
                <a href="{{ asset($data->$field_name) }}" data-lightbox="image-set" data-title="Path: {{ asset($data->$field_name) }}">
                    <img src="{{ asset($data->getMedia($module_name)->first()->getUrl('thumb300')) }}" class="figure-img img-fluid rounded img-thumbnail" alt="">
                </a>
                <!-- <figcaption class="figure-caption">Path: </figcaption> -->
            </figure>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="image_remove" id="image_remove" name="image_remove">
                <label class="form-check-label" for="image_remove">
                    Remove this image
                </label>
            </div>
        </div>
    </div>
    <x-library.lightbox />
    @endif
</div>
    <div class="col-12 col-sm-12 mb-12">
        <div class="form-group">
            <?php
            $field_name = 'Location';
            $field_lable = label_case($field_name);
            $field_placeholder = $field_lable;
            $required = "required"
            ?>
            {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
            {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
        </div>
    </div>
</div>

<div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>


<x-library.select2 />
