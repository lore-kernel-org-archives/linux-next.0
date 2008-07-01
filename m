From: Tony Breeds <tony@bakeyournoodle.com>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 30 - powerpc - build failure at arch_add_memory()
Date: Tue, 1 Jul 2008 11:34:38 +1000
Message-ID: <20080701013438.GT20457@bakeyournoodle.com>
References: <20080701001656.e156585c.sfr@canb.auug.org.au> <486924FE.4090801@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <486924FE.4090801@linux.vnet.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 30, 2008 at 11:55:02PM +0530, Kamalesh Babulal wrote:
> Hi Stephen,
>=20
> next-20080630 kernel build fails on powerpc, with randconfig
>=20
>   CC      arch/powerpc/mm/mem.o
> arch/powerpc/mm/mem.c: In function =E2=80=98arch_add_memory=E2=80=99:
> arch/powerpc/mm/mem.c:130: error: implicit declaration of function =E2=
=80=98create_section_mapping=E2=80=99
> make[1]: *** [arch/powerpc/mm/mem.o] Error 1
> make: *** [arch/powerpc/mm] Error 2

This problem exists in in 2.6.26-rc8, so it's not specifially linux-nex=
t
realted.  The patch at:
http://patchwork.ozlabs.org/linuxppc/patch?id=3D19347
should fix it but is un-ACK'd ;P

Yours Tony

  linux.conf.au    http://www.marchsouth.org/
  Jan 19 - 24 2009 The Australian Linux Technical Conference!

--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
