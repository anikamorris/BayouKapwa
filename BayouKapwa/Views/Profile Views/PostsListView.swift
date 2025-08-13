//
//  PostsListView.swift
//  BayouKapwa
//
//  Created by Anika Morris on 8/12/25.
//

import SwiftUI

struct PostsListView: View {

    let posts: [DBPost]

    var body: some View {
        List {
            ForEach(posts) { post in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(post.title ?? "")")
                            .fontWeight(.bold)
                        Text("\(post.details ?? "")")
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.45, green: 0.59, blue: 0.31), lineWidth: 2)
                }
            }
        }
        .listStyle(.plain)
    }
}
