From: "Madhani, Himanshu" <Himanshu.Madhani@cavium.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Thu, 22 Mar 2018 16:33:40 +0000
Message-ID: <A250A57E-79F6-4DB8-B956-BFFC60FBDA5A@cavium.com>
References: <20180322172503.2d8e72ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180322172503.2d8e72ef@canb.auug.org.au>
Content-Language: en-US
Content-ID: <A2906797B768C240944FF26AB5C3F827@namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Trapp, Darren" <Darren.Trapp@cavium.com>, "Tran, Quinn" <Quinn.Tran@cavium.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,=20


> On Mar 21, 2018, at 11:25 PM, Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
>=20
> Hi Martin,
>=20
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> drivers/scsi/qla2xxx/qla_gs.c: In function 'qla24xx_async_gnnft_done':
> drivers/scsi/qla2xxx/qla_gs.c:3974:7: error: 'fc4type' undeclared (first =
use in this function); did you mean 'fc4type_t'?
>  if ((fc4type =3D=3D FC4_TYPE_FCP_SCSI) && vha->flags.nvme_enabled)
>       ^~~~~~~
>       fc4type_t
> drivers/scsi/qla2xxx/qla_gs.c:3974:7: note: each undeclared identifier is=
 reported only once for each function it appears in
> drivers/scsi/qla2xxx/qla_gs.c:3975:3: error: too few arguments to functio=
n 'qla24xx_async_gpnft'
>   qla24xx_async_gpnft(vha, FC4_TYPE_NVME);
>   ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/scsi/qla2xxx/qla_def.h:4633:0,
>                 from drivers/scsi/qla2xxx/qla_gs.c:7:
> drivers/scsi/qla2xxx/qla_gbl.h:661:5: note: declared here
> int qla24xx_async_gpnft(scsi_qla_host_t *, u8, srb_t *);
>     ^~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>  33b28357dd00 ("scsi: qla2xxx: Fix Async GPN_FT for FCP and FC-NVMe scan"=
)
>=20
> interacting with commit
>=20
>  2b5b96473efc ("scsi: qla2xxx: Fix FC-NVMe LUN discovery")
>=20
> from Linus' tree.
>=20
> I have added the following merge fix patch for today. Unfortunately it
> produces this warning, so a better merge resolution is needed ...
>=20
> drivers/scsi/qla2xxx/qla_gs.c: In function 'qla24xx_async_gnnft_done':
> drivers/scsi/qla2xxx/qla_gs.c:3974:9: warning: 'rp' may be used uninitial=
ized in this function [-Wmaybe-uninitialized]
>  if ((rp->fc4type =3D=3D FC4_TYPE_FCP_SCSI) && vha->flags.nvme_enabled)
>       ~~^~~~~~~~~
>=20
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 22 Mar 2018 17:09:38 +1100
> Subject: [PATCH] scsi: qla2xxx: merge fix in qla_gs.c
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> drivers/scsi/qla2xxx/qla_gs.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/scsi/qla2xxx/qla_gs.c b/drivers/scsi/qla2xxx/qla_gs.=
c
> index f84807e850c3..d33f4619332e 100644
> --- a/drivers/scsi/qla2xxx/qla_gs.c
> +++ b/drivers/scsi/qla2xxx/qla_gs.c
> @@ -3971,8 +3971,8 @@ void qla24xx_async_gnnft_done(scsi_qla_host_t *vha,=
 srb_t *sp)
> 	vha->scan.scan_flags &=3D ~SF_SCANNING;
> 	spin_unlock_irqrestore(&vha->work_lock, flags);
>=20
> -	if ((fc4type =3D=3D FC4_TYPE_FCP_SCSI) && vha->flags.nvme_enabled)
> -		qla24xx_async_gpnft(vha, FC4_TYPE_NVME);
> +	if ((rp->fc4type =3D=3D FC4_TYPE_FCP_SCSI) && vha->flags.nvme_enabled)
> +		qla24xx_async_gpnft(vha, FC4_TYPE_NVME, NULL);
> }
>=20
> static void qla2x00_find_free_fcp_nvme_slot(struct scsi_qla_host *vha,
> --=20
> 2.16.1
>=20
> --=20
> Cheers,
> Stephen Rothwell

Thanks so much to attempt to fix the build failure. I was aware of this iss=
ue and had=20
send the diff yesterday with change that should be used for resolving merge=
 conflict and
compile failure.=20

Please use following to fix for the merge conflict and compile failure.=20

diff --git a/drivers/scsi/qla2xxx/qla_gs.c b/drivers/scsi/qla2xxx/qla_gs.c
index 403fa096f8c8..21eff2d30266 100644
--- a/drivers/scsi/qla2xxx/qla_gs.c
+++ b/drivers/scsi/qla2xxx/qla_gs.c
@@ -3973,9 +3973,6 @@ void qla24xx_async_gnnft_done(scsi_qla_host_t *vha, s=
rb_t *sp)
       spin_lock_irqsave(&vha->work_lock, flags);
       vha->scan.scan_flags &=3D ~SF_SCANNING;
       spin_unlock_irqrestore(&vha->work_lock, flags);
-
-       if ((fc4type =3D=3D FC4_TYPE_FCP_SCSI) && vha->flags.nvme_enabled)
-               qla24xx_async_gpnft(vha, FC4_TYPE_NVME);
}

static void qla2x00_async_gpnft_gnnft_sp_done(void *s, int res)
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index 5c5dcca4d1da..dab847ba4bce 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -4822,9 +4822,10 @@ void qla24xx_create_new_sess(struct scsi_qla_host *v=
ha, struct qla_work_evt *e)
                       fcport->d_id =3D e->u.new_sess.id;
                       fcport->flags |=3D FCF_FABRIC_DEVICE;
                       fcport->fw_login_state =3D DSC_LS_PLOGI_PEND;
-                       if (e->u.new_sess.fc4_type =3D=3D FC4_TYPE_FCP_SCSI=
) {
+                       if (e->u.new_sess.fc4_type & FC4_TYPE_FCP_SCSI)
                               fcport->fc4_type =3D FC4_TYPE_FCP_SCSI;
-                       } else if (e->u.new_sess.fc4_type =3D=3D FC4_TYPE_N=
VME) {
+
+                       if (e->u.new_sess.fc4_type & FC4_TYPE_NVME) {
                               fcport->fc4_type =3D FC4_TYPE_OTHER;
                               fcport->fc4f_nvme =3D FC4_TYPE_NVME;
                       }
(END)

Thanks,
- Himanshu
