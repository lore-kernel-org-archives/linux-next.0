From: Oded Gabbay <oded.gabbay@amd.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Thu, 29 Jan 2015 10:19:04 +0200
Message-ID: <54C9ECF8.6020309@amd.com>
References: <20150129131718.645dbb99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150129131718.645dbb99@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Goz <ben.goz@amd.com>
List-Id: linux-next.vger.kernel.org



On 01/29/2015 04:17 AM, Stephen Rothwell wrote:
> Hi Dave,
>
> Today's linux-next merge of the drm tree got conflicts in
> drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c and
> drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h between commits
> b8cbab042cd6 ("drm/amdkfd: Allow user to limit only queues per device")
> and 9fa843e76d90 ("drm/amdkfd: Fix bug in call to init_pipelines()")
> from Linus' tree and commits bcea30817574 ("drm/amdkfd: Add SDMA
> user-mode queues support to QCM") and fe502804205e ("drm/amdkfd: Remove
> call to deprecated init_memory interface") from the drm tree.
>
> I fixed it up (hopefully - see below) and can carry the fix as
> necessary (no action is required).
>
Looks fine, thanks!

	Oded
