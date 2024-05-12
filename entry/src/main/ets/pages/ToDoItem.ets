@Component
export struct ToDoItem {
  @Link todoList: any[];
  private item;
  private index;

  build() {
    Row() {
      Toggle({ type: ToggleType.Checkbox, isOn: false })
        .borderRadius(10)
        .height(20)
        .width(20)
      Row() {
        Text('' + this.item)
          .fontSize(16)
          .textAlign(TextAlign.Start)
        Text('删除')
          .fontSize(16)
          .textAlign(TextAlign.Start)
          .padding(2)
          .borderRadius(10)
          .fontColor(0xE84522)
          .onClick(() => this.todoList.splice(this.index, 1))
      }
      .width('80%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .height(50)
    .padding(5)
    .borderRadius(10)
    .backgroundColor(0xFFFFFF)
  }
}