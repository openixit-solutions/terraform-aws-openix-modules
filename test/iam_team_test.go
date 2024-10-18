package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestIamTeamUserCreationEnabled(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/iam_team/user_creation_enabled",
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	users := terraform.OutputMapOfObjects(t, terraformOptions, "users")
	mockUser1 := users["mock_user_1"].(map[string]interface{})

	if assert.Equal(t, mockUser1["path"], "/") {
		t.Log("Mock user path is /.")
	}

	tags := mockUser1["tags"].(map[string]interface{})
	if assert.Equal(t, tags["Terraform"], "true") {
		t.Log("Mock user tag Terraform is true.")
	}

	groupArn := terraform.Output(t, terraformOptions, "group_arn")
	if assert.Contains(t, groupArn, "mock-group") {
		t.Log("Mock group arn contains mock-group pattern.")
	}
}

func TestIamTeamUserCreationDisabled(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/iam_team/user_creation_disabled",
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	users := terraform.Output(t, terraformOptions, "users")
	if assert.Equal(t, users, "Users have been created without members.") {
		t.Log("Mock user list when create_users is disabled without objects.")
	}
}
