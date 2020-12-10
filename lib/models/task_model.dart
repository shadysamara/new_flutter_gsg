class Task {
  String taskName;
  bool isComplete;
  Task(this.taskName, this.isComplete);
  toggleTaskState() {
    this.isComplete = !this.isComplete;
  }
}
