require 'rails_helper'

RSpec.describe "HomeController", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /tasks" do
    context "with valid parameters" do
      it "creates a new task and redirects" do
        expect {
          post tasks_path, params: { task: { content: "เขียนเทสต์ RSpec" } }
        }.to change(Task, :count).by(1)

        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "PATCH /tasks/:id/toggle_status" do
    it "toggles the task status" do
      task = Task.create!(content: "ทำการบ้าน", status: false)

      patch toggle_status_task_path(task)

      expect(response).to redirect_to(root_path)
      expect(task.reload.status).to be true
    end
  end

  describe "DELETE /tasks/:id" do
    it "deletes the task" do
      task = Task.create!(content: "ลบฉันสิ")

      expect {
        delete task_path(task)
      }.to change(Task, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end
end
