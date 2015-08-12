From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 12 (include/linux/pci.h)
Date: Wed, 12 Aug 2015 11:05:36 -0700
Message-ID: <55CB8AF0.4060905@infradead.org>
References: <20150812233914.451d1fcf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20150812233914.451d1fcf@canb.auug.org.au>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 08/12/15 06:39, Stephen Rothwell wrote:
> Hi all,
>=20
> Changes since 20150810:
>=20

on i386 or x86_64:

Many (repeated) errors like this one:

=2E./include/linux/pci.h:390:12: error: =C3=A2=C2=80=C2=98struct pci_de=
v=C3=A2=C2=80=C2=99 has no member named =C3=A2=C2=80=C2=98physfn=C3=A2=C2=
=80=C2=99

when CONFIG_PCI_ATS is not enabled.


--=20
~Randy
