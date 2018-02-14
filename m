From: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: [RFC PATCH] elf: enforce MAP_FIXED on overlaying elf segments
 (was: Re: ppc elf_map breakage with MAP_FIXED_NOREPLACE)
Date: Wed, 14 Feb 2018 09:30:18 -0700
Message-ID: <1518625818.24026.2.camel@oracle.com>
References: <6db9b33d-fd46-c529-b357-3397926f0733@linux.vnet.ibm.com>
	 <20180129132235.GE21609@dhcp22.suse.cz>
	 <87k1w081e7.fsf@concordia.ellerman.id.au>
	 <20180130094205.GS21609@dhcp22.suse.cz>
	 <5eccdc1b-6a10-b48a-c63f-295f69473d97@linux.vnet.ibm.com>
	 <20180131131937.GA6740@dhcp22.suse.cz>
	 <bfecda5e-ae8b-df91-0add-df6322b42a70@linux.vnet.ibm.com>
	 <20180201131007.GJ21609@dhcp22.suse.cz>
	 <20180201134026.GK21609@dhcp22.suse.cz>
	 <CAGXu5j+fo0Z_ax2O10A-3D3puLhnX+o5M4Lp3TBsnE=NtFCjpw@mail.gmail.com>
	 <20180213100440.GM3443@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20180213100440.GM3443@dhcp22.suse.cz>
Sender: owner-linux-mm@kvack.org
To: Michal Hocko <mhocko@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: Anshuman Khandual <khandual@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, mm-commits@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2018-02-13 at 11:04 +0100, Michal Hocko wrote:
>=20
> From 97e7355a6dc31a73005fa806566a57eb5c38032b Mon Sep 17 00:00:00
> 2001
> From: Michal Hocko <mhocko@suse.com>
> Date: Tue, 13 Feb 2018 10:50:53 +0100
> Subject: [PATCH] elf: enforce MAP_FIXED on overlaying elf segments
>=20
> Anshuman has reported that some ELF binaries in his environment fail
> to
> start with
> =C2=A0[=C2=A0=C2=A0=C2=A023.423642] 9148 (sed): Uhuuh, elf segment at 000=
0000010030000
> requested but the memory is mapped already
> =C2=A0[=C2=A0=C2=A0=C2=A023.423706] requested [10030000, 10040000] mapped=
 [10030000,
> 10040000] 100073 anon
>=20
> The reason is that the above binary has overlapping elf segments:
> =C2=A0 LOAD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x0000000000000000 0x0000000010000000
> 0x0000000010000000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0000000000013a8c 0x0000000000013a8c=C2=A0=
=C2=A0R E=C2=A0=C2=A0=C2=A0=C2=A010000
> =C2=A0 LOAD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x000000000001fd40 0x000000001002fd40
> 0x000000001002fd40
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x00000000000002c0 0x00000000000005e8=C2=A0=
=C2=A0RW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010000
> =C2=A0 LOAD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x0000000000020328 0x0000000010030328
> 0x0000000010030328
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0000000000000384 0x00000000000094a0=C2=A0=
=C2=A0RW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A010000
>=20
> That binary has two RW LOAD segments, the first crosses a page border
> into the second
>=20
> 0x1002fd40 (LOAD2-vaddr) + 0x5e8 (LOAD2-memlen) =3D=3D 0x10030328 (LOAD3-
> vaddr)
>=20
> Handle this situation by enforcing MAP_FIXED when we establish a
> temporary brk VMA to handle overlapping segments. All other mappings
> will still use MAP_FIXED_NOREPLACE.
>=20
> Fixes: fs, elf: drop MAP_FIXED usage from elf_map
> Reported-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> Signed-off-by: Michal Hocko <mhocko@suse.com>
> ---
>=20

Looks reasonable to me.

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
