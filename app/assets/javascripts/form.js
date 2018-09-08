//Show the preview of markdown text
function setPreview(val){
  let preview = document.getElementById('preview');
  preview.innerHTML = html_content = markdown.toHTML(val);
}
