/*
output "management_groups" {
  value = flatten([
    merge(azurerm_management_group.mg, { level = var.level }),
    [
      for name in keys(local.children) :
      module.mg3[name].management_groups
    ]
  ])
}

output "management_group_id" {
  value = merge({
    id = azurerm_management_group.mg.id
    },
    {
      for name in keys(local.children) :
      name => module.mg3[name].management_group_id
  })
}
*/

output "output" {
  value = merge(azurerm_management_group.mg,
    {
      level = var.level
      children = [
        for name, _ in local.children : {
          name = module.mg3[name].output
        }
      ]
  })
}
