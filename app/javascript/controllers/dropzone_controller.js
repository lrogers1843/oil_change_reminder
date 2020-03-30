import Dropzone from "dropzone";
import { Controller } from "stimulus";
import { DirectUpload } from "@rails/activestorage";
import {
    getMetaValue,
    toArray,
    findElement,
    removeElement,
    insertAfter
} from "helpers";

export default class extends Controller {
    static targets = ["input"];

    connect() {
        this.dropZone = createDropZone(this);
        this.hideFileInput();
        this.bindEvents();
        Dropzone.autoDiscover = false;
    }

}


