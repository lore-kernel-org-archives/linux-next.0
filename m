From: KY Srinivasan <kys@microsoft.com>
Subject: RE: linux-next: manual merge of the akpm tree with the char-misc
 tree
Date: Wed, 20 Mar 2013 13:08:59 +0000
Message-ID: <878be14a66284fcda7c8e95c5f677fde@SN2PR03MB061.namprd03.prod.outlook.com>
References: <20130320152007.56de4a48eaf2760ccc07f02b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130320152007.56de4a48eaf2760ccc07f02b@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Wednesday, March 20, 2013 12:20 AM
> To: Andrew Morton
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Haiyang Zhang; KY
> Srinivasan; Greg KH; Arnd Bergmann
> Subject: linux-next: manual merge of the akpm tree with the char-misc tree
> 
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> include/linux/hyperv.h between commit 96dd86fa5881 ("Drivers: hv: Add a
> new driver to support host initiated backup") from the char-misc  tree
> and commit "drivers/video: add Hyper-V Synthetic Video Frame Buffer
> Driver" from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen,


K. Y
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/linux/hyperv.h
> index 95d0850,a460ee4..0000000
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@@ -1310,13 -1253,16 +1310,25 @@@ void vmbus_driver_unregister(struct
> hv_
>   		}
> 
>   /*
>  + * VSS (Backup/Restore) GUID
>  + */
>  +#define HV_VSS_GUID \
>  +	.guid = { \
>  +			0x29, 0x2e, 0xfa, 0x35, 0x23, 0xea, 0x36, 0x42, \
>  +			0x96, 0xae, 0x3a, 0x6e, 0xba, 0xcb, 0xa4,  0x40 \
>  +		}
> ++
> ++/*
> +  * Synthetic Video GUID
> +  * {DA0A7802-E377-4aac-8E77-0558EB1073F8}
> +  */
> + #define HV_SYNTHVID_GUID \
> + 	.guid = { \
> + 			0x02, 0x78, 0x0a, 0xda, 0x77, 0xe3, 0xac, 0x4a, \
> + 			0x8e, 0x77, 0x05, 0x58, 0xeb, 0x10, 0x73, 0xf8 \
> + 		}
> +
> +
>   /*
>    * Common header for Hyper-V ICs
>    */
