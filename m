From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: Tree for Dec 9 (ibmphp)
Date: Wed, 14 Dec 2011 08:30:16 -0800
Message-ID: <20111214083016.4c938d32@jbarnes-desktop>
References: <20111209163247.1de15dcb5b735ca5e1ad030b@canb.auug.org.au>
	<d4bdd33396b823c5241c4939b981e8a6.squirrel@xenotime.net>
	<4EE637F3.7070606@xenotime.net>
	<CAErSpo5dbAJiJ4FhR4bso+4MnJ9mk45T2Z+spmdzRr95w8jAZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAErSpo5dbAJiJ4FhR4bso+4MnJ9mk45T2Z+spmdzRr95w8jAZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 13 Dec 2011 17:41:08 -0700
Bjorn Helgaas <bhelgaas@google.com> wrote:

> On Mon, Dec 12, 2011 at 10:20 AM, Randy Dunlap <rdunlap@xenotime.net>=
 wrote:
> > On 12/09/2011 10:51 AM, Randy Dunlap wrote:
> >>
> >> On Thu, December 8, 2011 9:32 pm, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20111208:
> >>
> >> (This build error =A0was first seen in 20111208.)
> >>
> >>
> >> ERROR: "pci_scan_bus" [drivers/pci/hotplug/ibmphp.ko] undefined!
> >>
> >> Full randconfig file is attached.
> >
> >
> > Same for 20111212.
>=20
> I changed pci_scan_bus() from an inline function (visible to modules)
> to a normal function (by default, not visible to modules), which brok=
e
> the ibmphp.ko build.
>=20
> The updated patch is attached, as well as the incremental change (jus=
t
> adding "EXPORT_SYMBOL(pci_scan_bus);".
>=20
> (Also available at git://github.com/bjorn-helgaas/linux.git on the "p=
ci-scan-v6"
> branch as bef4a9eefaa69dd9bc998e29d619127d1653683d)

Just pushed the fix (rolled it into a v2 of the convert patch).

--=20
Jesse Barnes, Intel Open Source Technology Center
