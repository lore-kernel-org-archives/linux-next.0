From: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the isci tree with the scsi tree
Date: Mon, 12 Mar 2012 19:50:33 -0700
Message-ID: <CABE8wwtNcA4QcJyLC6zipjygjAYa6o=bwPyz6xS9A=PLiU+2kg@mail.gmail.com>
References: <20120313134512.848baf17f46729fa0fac195d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120313134512.848baf17f46729fa0fac195d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 12, 2012 at 7:45 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Dan,
>
> Today's linux-next merge of the isci tree produced a large number of
> conflicts against the scsi.
>
> =A0Merging isci/all
> +CONFLICT (content): Merge conflict in include/scsi/sas_ata.h
> =A0CONFLICT (content): Merge conflict in include/scsi/libsas.h
> +CONFLICT (content): Merge conflict in include/linux/libata.h
> =A0CONFLICT (content): Merge conflict in drivers/scsi/libsas/sas_scsi=
_host.c
> +CONFLICT (content): Merge conflict in drivers/scsi/libsas/sas_intern=
al.h
> =A0CONFLICT (content): Merge conflict in drivers/scsi/libsas/sas_init=
=2Ec
> =A0CONFLICT (content): Merge conflict in drivers/scsi/libsas/sas_expa=
nder.c
> +CONFLICT (content): Merge conflict in drivers/scsi/libsas/sas_event.=
c
> =A0CONFLICT (content): Merge conflict in drivers/scsi/libsas/sas_disc=
over.c
> +CONFLICT (content): Merge conflict in drivers/scsi/libsas/sas_ata.c
> +CONFLICT (content): Merge conflict in drivers/scsi/isci/request.h
> =A0CONFLICT (content): Merge conflict in drivers/scsi/isci/registers.=
h
> +CONFLICT (content): Merge conflict in drivers/scsi/isci/port.h
> +CONFLICT (content): Merge conflict in drivers/scsi/isci/port.c
> +CONFLICT (content): Merge conflict in drivers/scsi/isci/phy.c
> =A0CONFLICT (content): Merge conflict in drivers/scsi/isci/init.c
>
> Since you are feeding patches into the scsi tree (instaed of having y=
ou
> tree merged into the scsi tree), you should rebase your tree in the s=
csi
> tree after your patches have been accepted. =A0The above conflicts ar=
e
> (almost completely) caused by having the same patches in both trees w=
ith
> additional changes to those files in your tree.

I was wondering why it had not happened prior to this point...  in any
event I'll get my tree rebased on top scsi-misc so that isci.git#all
will just be the pending delta.
