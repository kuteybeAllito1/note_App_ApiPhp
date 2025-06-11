class NotesModel {
  int? notesId;
  String? noteTitle;
  String? noteContent;
  String? noteImage;
  int? noteUsers;

  NotesModel(
      {this.notesId,
      this.noteTitle,
      this.noteContent,
      this.noteImage,
      this.noteUsers});

  NotesModel.fromJson(Map<String, dynamic> json) {
    notesId = json['notes_id'];
    noteTitle = json['note_title'];
    noteContent = json['note_content'];
    noteImage = json['note_image'];
    noteUsers = json['note_users'];
    print(noteImage);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes_id'] = this.notesId;
    data['note_title'] = this.noteTitle;
    data['note_content'] = this.noteContent;
    data['note_image'] = this.noteImage;
    data['note_users'] = this.noteUsers;
    return data;
  }
}
