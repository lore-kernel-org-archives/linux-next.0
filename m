From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the scsi tree with the staging tree
Date: Tue, 5 Sep 2017 10:18:51 +1000
Message-ID: <20170905101851.161e5677@canb.auug.org.au>
References: <20170828164127.15902025@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170828164127.15902025@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hannes Reinecke <hare@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Sameer Wadgaonkar <sameer.wadgaonkar@unisys.com>
List-Id: linux-next.vger.kernel.org

Hi all,

On Mon, 28 Aug 2017 16:41:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the scsi tree got a conflict in:
> 
>   drivers/staging/unisys/visorhba/visorhba_main.c
> 
> between commits:
> 
>   781facd05eb9 ("staging: unisys: visorhba: visorhba_main.c: fixed comment formatting issues")
> 
> from the staging tree and commit:
> 
>   7bc4e528d9f6 ("scsi: visorhba: sanitze private device data allocation")
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
> diff --cc drivers/staging/unisys/visorhba/visorhba_main.c
> index 8567e447891e,ddce92552ff5..000000000000
> --- a/drivers/staging/unisys/visorhba/visorhba_main.c
> +++ b/drivers/staging/unisys/visorhba/visorhba_main.c
> @@@ -44,12 -44,11 +44,11 @@@ static struct visor_channeltype_descrip
>   };
>   
>   MODULE_DEVICE_TABLE(visorbus, visorhba_channel_types);
>  -MODULE_ALIAS("visorbus:" VISOR_VHBA_CHANNEL_UUID_STR);
>  +MODULE_ALIAS("visorbus:" VISOR_VHBA_CHANNEL_GUID_STR);
>   
>   struct visordisk_info {
> + 	struct scsi_device *sdev;
>   	u32 valid;
> - 	/* Disk Path */
> - 	u32 channel, id, lun;
>   	atomic_t ios_threshold;
>   	atomic_t error_count;
>   	struct visordisk_info *next;
> @@@ -105,25 -101,19 +104,19 @@@ struct visorhba_devices_open 
>   	struct visorhba_devdata *devdata;
>   };
>   
> - #define for_each_vdisk_match(iter, list, match) \
> - 	for (iter = &list->head; iter->next; iter = iter->next) \
> - 		if ((iter->channel == match->channel) && \
> - 		    (iter->id == match->id) && \
> - 		    (iter->lun == match->lun))
> - 
>   /*
>  - *	visor_thread_start - starts a thread for the device
>  - *	@threadfn: Function the thread starts
>  - *	@thrcontext: Context to pass to the thread, i.e. devdata
>  - *	@name: string describing name of thread
>  + * visor_thread_start - Starts a thread for the device
>  + * @threadfn:   Function the thread starts
>  + * @thrcontext: Context to pass to the thread, i.e. devdata
>  + * @name:	String describing name of thread
>    *
>  - *	Starts a thread for the device.
>  + * Starts a thread for the device.
>    *
>  - *	Return the task_struct * denoting the thread on success,
>  - *             or NULL on failure
>  + * Return: The task_struct * denoting the thread on success,
>  + *	   or NULL on failure
>    */
>  -static struct task_struct *visor_thread_start
>  -(int (*threadfn)(void *), void *thrcontext, char *name)
>  +static struct task_struct *visor_thread_start(int (*threadfn)(void *),
>  +					      void *thrcontext, char *name)
>   {
>   	struct task_struct *task;
>   
> @@@ -302,21 -280,19 +295,20 @@@ static void cleanup_scsitaskmgmt_handle
>   }
>   
>   /*
>  - *	forward_taskmgmt_command - send taskmegmt command to the Service
>  - *				   Partition
>  - *	@tasktype: Type of taskmgmt command
>  - *	@scsidev: Scsidev that issued command
>  + * forward_taskmgmt_command - Send taskmegmt command to the Service
>  + *			      Partition
>  + * @tasktype: Type of taskmgmt command
>  + * @scsidev:  Scsidev that issued command
>    *
>  - *	Create a cmdrsp packet and send it to the Serivce Partition
>  - *	that will service this request.
>  - *	Returns whether the command was queued successfully or not.
>  + * Create a cmdrsp packet and send it to the Serivce Partition
>  + * that will service this request.
>  + *
>  + * Return: Int representing whether command was queued successfully or not
>    */
>   static int forward_taskmgmt_command(enum task_mgmt_types tasktype,
> - 				    struct scsi_cmnd *scsicmd)
> + 				    struct scsi_device *scsidev)
>   {
>   	struct uiscmdrsp *cmdrsp;
> - 	struct scsi_device *scsidev = scsicmd->device;
>   	struct visorhba_devdata *devdata =
>   		(struct visorhba_devdata *)scsidev->host->hostdata;
>   	int notifyresult = 0xffff;
> @@@ -607,24 -570,19 +604,21 @@@ static int visorhba_slave_alloc(struct 
>   	struct visorhba_devdata *devdata;
>   	struct Scsi_Host *scsihost = (struct Scsi_Host *)scsidev->host;
>   
> ++	/* already allocated return success */
> + 	if (scsidev->hostdata)
>  -		return 0; /* already allocated return success */
> ++		return 0;
> + 
>  +	/* even though we errored, treat as success */
>   	devdata = (struct visorhba_devdata *)scsihost->hostdata;
>   	if (!devdata)
>  -		return 0; /* even though we errored, treat as success */
>  +		return 0;
>   
> - 	/* already allocated return success */
> - 	for_each_vdisk_match(vdisk, devdata, scsidev)
> - 		return 0;
> - 
> - 	tmpvdisk = kzalloc(sizeof(*tmpvdisk), GFP_ATOMIC);
> - 	if (!tmpvdisk)
> + 	vdisk = kzalloc(sizeof(*vdisk), GFP_ATOMIC);
> + 	if (!vdisk)
>   		return -ENOMEM;
>   
> - 	tmpvdisk->channel = scsidev->channel;
> - 	tmpvdisk->id = scsidev->id;
> - 	tmpvdisk->lun = scsidev->lun;
> - 	vdisk->next = tmpvdisk;
> + 	vdisk->sdev = scsidev;
> + 	scsidev->hostdata = vdisk;
>   	return 0;
>   }
>   
> @@@ -814,16 -766,16 +802,15 @@@ static int visorhba_serverdown(struct v
>   }
>   
>   /*
>  - *	do_scsi_linuxstat - scsi command returned linuxstat
>  - *	@cmdrsp: response from IOVM
>  - *	@scsicmd: Command issued.
>  + * do_scsi_linuxstat - Scsi command returned linuxstat
>  + * @cmdrsp:  Response from IOVM
>  + * @scsicmd: Command issued
>    *
>  - *	Don't log errors for disk-not-present inquiries
>  - *	Returns void
>  + * Don't log errors for disk-not-present inquiries.
>    */
>  -static void
>  -do_scsi_linuxstat(struct uiscmdrsp *cmdrsp, struct scsi_cmnd *scsicmd)
>  +static void do_scsi_linuxstat(struct uiscmdrsp *cmdrsp,
>  +			      struct scsi_cmnd *scsicmd)
>   {
> - 	struct visorhba_devdata *devdata;
>   	struct visordisk_info *vdisk;
>   	struct scsi_device *scsidev;
>   

Just a reminder that the above conflict still exists.

-- 
Cheers,
Stephen Rothwell
