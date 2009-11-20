From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: microblaze tree build failure
Date: Fri, 20 Nov 2009 13:23:39 -0700
Message-ID: <fa686aa40911201223t1d82f43an3f52fa2599088d3b@mail.gmail.com>
References: <20091120095622.5fefb9fa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755869AbZKTUX4@vger.kernel.org>
In-Reply-To: <20091120095622.5fefb9fa.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Simek <michal.simek@petalogix.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Fontenot <nfont@austin.ibm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Nov 19, 2009 at 3:56 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Michal,
>
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> arch/powerpc/platforms/built-in.o: In function `.ofdt_write':
> reconfig.c:(.text+0xca08): undefined reference to `.of_attach_node'
> arch/powerpc/platforms/built-in.o: In function `.do_device_node':
> vio.c:(.text+0x1be2c): undefined reference to `.of_attach_node'
>
> Caused by commit 5d0c1c076548e1f8d590a2f70f281b4eb7b3aeb2 ("Merge
> of_attach_node") which I have reverted for today. =A0That patch is mi=
ssing
> an update to drivers/of/Makefile at least ... and probably some other
> stuff as well.

=2E.. and the OF changes shouldn't be going through the microblaze tree=
=2E
 This looks like it was an accident.  Michal?

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
