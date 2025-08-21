return {
    "cameron-wags/splash.nvim",
    config = function()
        require("splash").setup {
            text = {
                [[          Lambda(/ˈlæmdə/; uppercase Λ, lowercase λ; Greek: λάμ(β)δα, lám(b)da)]],
                [[             is  the eleventh letter  of  the Greek  alphabet,]],
                [[               representing  the voiced alveolar  lateral approximant  IPA;]],
                [[        it derives  from the  Phoenician  letter Lamed,]],
                [[                                 and  gave  rise to Latin L and  Cyrillic El (Л).]],
                [[     In the  system of Greek numerals, lambda  has a value  of 30.]],
                [[The ancient  grammarians typically  called it λάβδα (lắbdă, [lábda]) in Classical Greek times,]],
                [[                  whereas in  Modern Greek it is  λάμδα (lámda, [ˈlamða]),]],
                [[     while the spelling  λάμβδα (lámbda) was used (to varying degrees) throughout]],
                [[                                             the lengthy  transition between the two.]],
            },
            -- text_width = 100
        }
    end,
}
