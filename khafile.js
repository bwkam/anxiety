let project = new Project("Project");

project.addAssets("Assets/**");
project.addShaders("Shaders/**");
project.addSources("Sources");

// libs
project.addLibrary("echo");
project.addLibrary("glm");

resolve(project);
