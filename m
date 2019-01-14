From: =?UTF-8?B?6buD5riF6ZqG?= <ching2048@areca.com.tw>
Subject: Re: linux-next: manual merge of the scsi tree with Linus' tree
Date: Mon, 14 Jan 2019 13:42:45 +0800
Message-ID: <CAKiknE937fCJ0fyphOKvez_OWgearpfMXhxigW_e=XN2t3ktKg@mail.gmail.com>
References: <20190114134726.335c1da6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114134726.335c1da6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Christoph Hellwig <hch@lst.de>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

Thanks Stephen's help.

Ching Huang

Stephen Rothwell <sfr@canb.auug.org.au> =E6=96=BC 2019=E5=B9=B41=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:48=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hi all,
>
> Today's linux-next merge of the scsi tree got a conflict in:
>
>   drivers/scsi/arcmsr/arcmsr_hba.c
>
> between commit:
>
>   750afb08ca71 ("cross-tree: phase out dma_zalloc_coherent()")
>
> from Linus' tree and commit:
>
>   381d66da7212 ("scsi: arcmsr: Rename acb structure member roundup_ccbsiz=
e to ioqueue_size")
>
> from the scsi tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/scsi/arcmsr/arcmsr_hba.c
> index 57c6fa388bf6,9f85d5abbb0c..000000000000
> --- a/drivers/scsi/arcmsr/arcmsr_hba.c
> +++ b/drivers/scsi/arcmsr/arcmsr_hba.c
> @@@ -585,12 -641,9 +641,11 @@@ static bool arcmsr_alloc_io_queue(struc
>
>         switch (acb->adapter_type) {
>         case ACB_ADAPTER_TYPE_B: {
> -               struct MessageUnit_B *reg;
> -               acb->roundup_ccbsize =3D roundup(sizeof(struct MessageUni=
t_B), 32);
> +               acb->ioqueue_size =3D roundup(sizeof(struct MessageUnit_B=
), 32);
>  -              dma_coherent =3D dma_zalloc_coherent(&pdev->dev, acb->ioq=
ueue_size,
>  -                      &dma_coherent_handle, GFP_KERNEL);
>  +              dma_coherent =3D dma_alloc_coherent(&pdev->dev,
> -                                                 acb->roundup_ccbsize,
> ++                                                acb->ioqueue_size,
>  +                                                &dma_coherent_handle,
>  +                                                GFP_KERNEL);
>                 if (!dma_coherent) {
>                         pr_notice("arcmsr%d: DMA allocation failed\n", ac=
b->host->host_no);
>                         return false;
> @@@ -616,13 -655,9 +657,11 @@@
>                 }
>                 break;
>         case ACB_ADAPTER_TYPE_D: {
> -               struct MessageUnit_D *reg;
> -
> -               acb->roundup_ccbsize =3D roundup(sizeof(struct MessageUni=
t_D), 32);
> +               acb->ioqueue_size =3D roundup(sizeof(struct MessageUnit_D=
), 32);
>  -              dma_coherent =3D dma_zalloc_coherent(&pdev->dev, acb->ioq=
ueue_size,
>  -                      &dma_coherent_handle, GFP_KERNEL);
>  +              dma_coherent =3D dma_alloc_coherent(&pdev->dev,
> -                                                 acb->roundup_ccbsize,
> ++                                                acb->ioqueue_size,
>  +                                                &dma_coherent_handle,
>  +                                                GFP_KERNEL);
>                 if (!dma_coherent) {
>                         pr_notice("arcmsr%d: DMA allocation failed\n", ac=
b->host->host_no);
>                         return false;
> @@@ -662,11 -671,9 +675,11 @@@
>         case ACB_ADAPTER_TYPE_E: {
>                 uint32_t completeQ_size;
>                 completeQ_size =3D sizeof(struct deliver_completeQ) * ARC=
MSR_MAX_HBE_DONEQUEUE + 128;
> -               acb->roundup_ccbsize =3D roundup(completeQ_size, 32);
> +               acb->ioqueue_size =3D roundup(completeQ_size, 32);
>  -              dma_coherent =3D dma_zalloc_coherent(&pdev->dev, acb->ioq=
ueue_size,
>  -                      &dma_coherent_handle, GFP_KERNEL);
>  +              dma_coherent =3D dma_alloc_coherent(&pdev->dev,
> -                                                 acb->roundup_ccbsize,
> ++                                                acb->ioqueue_size,
>  +                                                &dma_coherent_handle,
>  +                                                GFP_KERNEL);
>                 if (!dma_coherent){
>                         pr_notice("arcmsr%d: DMA allocation failed\n", ac=
b->host->host_no);
>                         return false;
