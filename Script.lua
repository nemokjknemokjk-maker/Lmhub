local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Lm Hub",
    LoadingTitle = "Lm Hub",
    LoadingSubtitle = "By LM",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = true,
    KeySettings = {
        Title = "Lm Hub Key",
        Subtitle = "Digite a Key",
        Note = "Key: Lm ofc",
        FileName = "LMKEY",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"Lm ofc"}
    }
})

local Funcoes = Window:CreateTab("Funções", 4483362458)
local Admin = Window:CreateTab("Admin", 4483362458)

-- Infinite Jump
local InfiniteJump = false

Funcoes:CreateButton({
    Name = "Infinite Jump",
    Callback = function()
        InfiniteJump = not InfiniteJump
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJump then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Invisível Visual
Funcoes:CreateButton({
    Name = "Invisível",
    Callback = function()
        local Character = game.Players.LocalPlayer.Character

        for _,v in pairs(Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.LocalTransparencyModifier = 1
            end
        end
    end
})

-- Slider Velocidade
Funcoes:CreateSlider({
    Name = "Velocidade",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.WalkSpeed = Value
        end
    end
})

-- Fling Local
Funcoes:CreateButton({
    Name = "Fling Local",
    Callback = function()
        local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart

        local bv = Instance.new("BodyAngularVelocity")
        bv.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bv.AngularVelocity = Vector3.new(9999,9999,9999)
        bv.Parent = hrp

        task.wait(2)

        bv:Destroy()
    end
})

-- Kick Visual
Funcoes:CreateButton({
    Name = "Ban Visual",
    Callback = function()
        game.Players.LocalPlayer:Kick("Você foi banido")
    end
})

-- ADMIN VISUAL

Admin:CreateButton({
    Name = "Kick Visual",
    Callback = function()
        Rayfield:Notify({
            Title = "Admin",
            Content = "Jogador foi expulso do servidor",
            Duration = 5
        })
    end
})

Admin:CreateButton({
    Name = "Ice Visual",
    Callback = function()
        Rayfield:Notify({
            Title = "Admin",
            Content = "Jogador foi congelado",
            Duration = 5
        })
    end
})

Admin:CreateButton({
    Name = "Jail Visual",
    Callback = function()
        Rayfield:Notify({
            Title = "Admin",
            Content = "Jogador foi preso",
            Duration = 5
        })
    end
})
