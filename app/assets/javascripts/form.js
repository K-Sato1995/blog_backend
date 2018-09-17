//Show the preview of markdown text
function setPreview(val){
  var preview = document.getElementById('preview');
  preview.innerHTML = html_content = markdown.toHTML(val);
}
