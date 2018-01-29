From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Subject: Re: ppc elf_map breakage with MAP_FIXED_NOREPLACE
Date: Mon, 29 Jan 2018 11:02:09 +0530
Message-ID: <6db9b33d-fd46-c529-b357-3397926f0733@linux.vnet.ibm.com>
References: <20180109161355.GL1732@dhcp22.suse.cz>
 <a495f210-0015-efb2-a6a7-868f30ac4ace@linux.vnet.ibm.com>
 <20180117080731.GA2900@dhcp22.suse.cz>
 <082aa008-c56a-681d-0949-107245603a97@linux.vnet.ibm.com>
 <20180123124545.GL1526@dhcp22.suse.cz>
 <ef63c070-dcd7-3f26-f6ec-d95404007ae2@linux.vnet.ibm.com>
 <20180123160653.GU1526@dhcp22.suse.cz>
 <2a05eaf2-20fd-57a8-d4bd-5a1fbf57686c@linux.vnet.ibm.com>
 <20180124090539.GH1526@dhcp22.suse.cz>
 <5acba3c2-754d-e449-24ff-a72a0ad0d895@linux.vnet.ibm.com>
 <20180126140415.GD5027@dhcp22.suse.cz>
 <15da8c87-e6db-13aa-01c8-a913656bfdb6@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <15da8c87-e6db-13aa-01c8-a913656bfdb6@linux.vnet.ibm.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Anshuman Khandual <khandual@linux.vnet.ibm.com>, Michal Hocko <mhocko@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

On 01/29/2018 08:17 AM, Anshuman Khandual wrote:
> On 01/26/2018 07:34 PM, Michal Hocko wrote:
>> On Fri 26-01-18 18:04:27, Anshuman Khandual wrote:
>> [...]
>>> I tried to instrument mmap_region() for a single instance of 'sed'
>>> binary and traced all it's VMA creation. But there is no trace when
>>> that 'anon' VMA got created which suddenly shows up during subsequent
>>> elf_map() call eventually failing it. Please note that the following
>>> VMA was never created through call into map_region() in the process
>>> which is strange.
>>
>> Could you share your debugging patch?
> 
> Please find the debug patch at the end.
> 
>>
>>> =================================================================
>>> [    9.076867] Details for VMA[3] c000001fce42b7c0
>>> [    9.076925] vma c000001fce42b7c0 start 0000000010030000 end 0000000010040000
>>> next c000001fce42b580 prev c000001fce42b880 mm c000001fce40fa00
>>> prot 8000000000000104 anon_vma           (null) vm_ops           (null)
>>> pgoff 1003 file           (null) private_data           (null)
>>> flags: 0x100073(read|write|mayread|maywrite|mayexec|account)
>>> =================================================================
>>
>> Isn't this vdso or some other special mapping? It is not really an
>> anonymous vma. Please hook into __install_special_mapping
> 
> Yeah, will do. Its not an anon mapping as it does not have a anon_vma
> structure ?

Okay, this colliding VMA seems to be getting loaded from load_elf_binary()
function as well.

[    9.422410] vma c000001fceedbc40 start 0000000010030000 end 0000000010040000
next c000001fceedbe80 prev c000001fceedb700 mm c000001fceea8200
prot 8000000000000104 anon_vma           (null) vm_ops           (null)
pgoff 1003 file           (null) private_data           (null)
flags: 0x100073(read|write|mayread|maywrite|mayexec|account)
[    9.422576] CPU: 46 PID: 7457 Comm: sed Not tainted 4.14.0-dirty #158
[    9.422610] Call Trace:
[    9.422623] [c000001fdc4f79b0] [c000000000b17ac0] dump_stack+0xb0/0xf0 (unreliable)
[    9.422670] [c000001fdc4f79f0] [c0000000002dafb8] do_brk_flags+0x2d8/0x440
[    9.422708] [c000001fdc4f7ac0] [c0000000002db3d0] vm_brk_flags+0x80/0x130
[    9.422747] [c000001fdc4f7b20] [c0000000003d23a4] set_brk+0x80/0xdc
[    9.422785] [c000001fdc4f7b60] [c0000000003d1f24] load_elf_binary+0x1304/0x158c
[    9.422830] [c000001fdc4f7c80] [c00000000035d3e0] search_binary_handler+0xd0/0x270
[    9.422881] [c000001fdc4f7d10] [c00000000035f338] do_execveat_common.isra.31+0x658/0x890
[    9.422926] [c000001fdc4f7df0] [c00000000035f980] SyS_execve+0x40/0x50
[    9.423588] [c000001fdc4f7e30] [c00000000000b220] system_call+0x58/0x6c

which is getting hit after adding some more debug.

@@ -2949,6 +2997,13 @@ static int do_brk_flags(unsigned long addr, unsigned long request, unsigned long
        if (flags & VM_LOCKED)
                mm->locked_vm += (len >> PAGE_SHIFT);
        vma->vm_flags |= VM_SOFTDIRTY;
+
+       if (!strcmp(current->comm, "sed")) {
+               if (just_init && (mm_ptr == vma->vm_mm)) {
+                       dump_vma(vma);
+                       dump_stack();
+               }
+       }
        return 0;
 }
