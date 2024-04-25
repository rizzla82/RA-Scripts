# https://www.javydekoning.com/powercli-one-liner-test-vsphereesxi-root-passwords/

get-vmhost | %{
  $null = connect-viserver $_.name `
  -user root -password "fakepassword" -EA 0

  if (-not ($?)) {
    write-warning "Password failed for $($_.name)"
  } else {
    Disconnect-VIServer $_.name -force -confirm:$false
  }
}
