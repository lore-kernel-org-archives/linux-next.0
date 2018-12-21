From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: Tree for Dec 21 (nvdimm/security.o)
Date: Fri, 21 Dec 2018 10:51:49 -0800
Message-ID: <CAPcyv4ic3Sf+KGcL3tDUx73GVY_gXmf4WPCxfA63jT6bW3LAEA@mail.gmail.com>
References: <20181221193244.3a6ed685@canb.auug.org.au> <8ae0ad4e-0c5c-a3dc-51b4-1616f459e45b@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8ae0ad4e-0c5c-a3dc-51b4-1616f459e45b@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>
List-Id: linux-next.vger.kernel.org

On Fri, Dec 21, 2018 at 10:44 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 12/21/18 12:32 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > News: there will be no linux-next release until Jan 2.  Have a good break.
> >
> > Changes since 20181220:
> >
>
> on x86_64:
>
> ld: drivers/nvdimm/security.o: in function `nvdimm_request_key':
> security.c:(.text+0xbe): undefined reference to `key_type_encrypted'
> ld: drivers/nvdimm/security.o: in function `nvdimm_lookup_user_key.isra.1':
> security.c:(.text+0x1ea): undefined reference to `key_type_encrypted'
>
>
> Full randconfig file is attached.

Could you send me that randconfig, offlist is fine.

It seems the "depends on ENCRYPTED_KEYS" I added is not sufficient.
