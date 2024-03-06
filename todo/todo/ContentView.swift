//
//  ContentView.swift
//  todo
//
//  Created by StudentAM on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    // this variable will hold and update the number of tasks in the list and being displayed
    @State var taskCount: Int = 0
    //this variable will hold anythin thing that is being typed in to the input
    @State var input: String = ""
    // this array will hold every string that is a tasked typed into the input when the add button is pressed the input gets put in the array
    @State var tasks : [String] = []
    var body: some View {
        // the nav view is what allows allows all the text and input to be pushed farther left on the screen
        NavigationView {
            // vstack allows for the things to be arranged vertically
            VStack {
                //Hstack is like v stack but horizontal
                HStack{
                    //dislaying num of tasks
                    Text("Number of Tasks:\(taskCount)")
                        .padding()
                    Spacer()
                }
                //Puts input and add typed to input variable
                TextField("Type here...", text: $input)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                    //when button pressed runs add function
                    Button("Add Task",action: add)
                        .padding()
                        .background(input.count > 0 ? Color.blue: Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    // when button pressed remove all function runs
                    Button("Remove All Tasks ",action: removeAll )
                        .padding()
                        .background(tasks.count > 0 ? Color.blue: Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                Spacer()
                //a list where for every string in thr input array a task on the list is created the bottom portion allows for the swipe delete
                List{
                    ForEach(tasks,id: \.self){ task in
                        Text("\(task)")
                    }
                    
                    .onDelete(perform: { index in
                        tasks.remove(atOffsets: index)
                        taskCount -= 1
                    })
                    
                }
               
              
                //nav title makes the to do list legit the title putting it high up and bold
            }
            .navigationTitle("To Do List")
           
        }
        
    }
    func add(){
        //if the input  is not empty add 1 to count and put the input in the tasks to display thrn clear it from the inputafter you add to the list
        if !input.isEmpty{
            taskCount += 1
        tasks.append(input)
            input = ""
        }

}
    // clear the count and delete all tasks in the array
    func removeAll(){
        if taskCount != 0{
            taskCount = 0
        }
        tasks = []
            
    }
}

#Preview {
    ContentView()
}
