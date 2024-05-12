import { ToDoItem } from './ToDoItem'

@Entry
@Component
struct ToDoList {
  @State message: string = 'Hello World'
  @State text: string = ''
  @State todoList: any[] = []
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Text('待办事项')
        .fontSize(24)
        .padding({ bottom: 10 })
        .fontWeight(FontWeight.Bold)
        .width('100%')
      List({ space: 10, initialIndex: 0 }) {
        ForEach(this.todoList, (todo, index) => {
          ListItem() {
            ToDoItem({ todoList: $todoList, item: todo, index })
          }
        }, todo => todo)
      }
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.Spring)
      .width('100%')
      .height(60*this.todoList.length)
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
        TextInput({ text: this.text, placeholder: '添加待办事项', controller: this.controller })
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .width('75%')
          .height(40)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value
          })
        Button('添加', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(20)
          .backgroundColor(0x317aff)
          .width('20%')
          .onClick(() => {
            if (this.text.trim().length > 0) {
              this.todoList.push(this.text)
              this.text = ''
            }
          })
      }.margin({ top: 10 })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(0xF9F9F9)
    .padding(20)
  }
}