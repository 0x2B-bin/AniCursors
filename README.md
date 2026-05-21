
# Table of Contents

1.  [AniCursors](#orgc95d05d)
    1.  [Installation](#org39d6b02)
    2.  [Cursors](#orgc2dd289)



<a id="orgc95d05d"></a>

# AniCursors

This is a nix flake that provides that provides a collection of anime cursors for NixOS


<a id="org39d6b02"></a>

## Installation

Add AniCursors to your flake.nix inputs

    inputs = {
      anicursors = {
        url = "github:0x2B-bin/AniCursors";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

Then add the cursor you want into environment.systemPackages like so

    environment.systemPackages = [
      inputs.anicursors.default # For all cursors
      inputs.anicursors.acheron_blz # Just acheron cursor
      inputs.anicursors.chisa_blz # Just chisa cursor
      # So on...
    ];


<a id="orgc2dd289"></a>

## Cursors

Here is a gallery of the available cursors

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">acheron<sub>blz</sub> &lt;br&gt; <img src="./Assets/acheron_blz.gif" alt="acheron_blz.gif" /></td>
<td class="org-left">chisa<sub>blz</sub> &lt;br&gt; <img src="./Assets/chisa_blz.gif" alt="chisa_blz.gif" /></td>
</tr>

<tr>
<td class="org-left">miku<sub>blz</sub> &lt;br&gt; <img src="./Assets/miku_blz.gif" alt="miku_blz.gif" /></td>
<td class="org-left">miyabi<sub>blz</sub> &lt;br&gt; <img src="./Assets/miyabi_blz.gif" alt="miyabi_blz.gif" /></td>
</tr>
</tbody>
</table>

