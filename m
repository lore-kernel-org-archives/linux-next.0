From: =?windows-1252?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 22 Jun 2015 09:20:57 +0200
Message-ID: <5587B759.3090504@amd.com>
References: <20150621135051.27364542@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150621135051.27364542@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?windows-1252?Q?Marek_Ol=9A=E1k?= <marek.olsak@amd.com>, =?windows-1252?Q?Michel_D=E4nzer?= <michel.daenzer@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen & Dave,

indeed RADEON_INFO_VA_UNMAP_WORKING was added to 4.1 to indicate that a 
certain kernel bug is fixed now and we can remove the user space workaround.

And RADEON_INFO_GPU_RESET_COUNTER was stashed to be merged in 4.2 as new 
feature.

Annoying but harmless and Stephen's resolve of the conflict looks valid 
to me.

Regards,
Christian.

On 21.06.2015 05:50, Stephen Rothwell wrote:
> Hi Dave,
>
> Today's linux-next merge of the drm tree got conflicts in:
>
>    drivers/gpu/drm/radeon/radeon_kms.c
>    include/uapi/drm/radeon_drm.h
>
> between commit:
>
>    3bc980bf19bb ("drm/radeon: Add RADEON_INFO_VA_UNMAP_WORKING query")
>
> from Linus' tree and commit:
>
>    72b9076b2887 ("drm/radeon: add a GPU reset counter queryable by userspace")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
