From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Wed, 20 May 2015 05:41:46 +0100 (IST)
Message-ID: <alpine.DEB.2.00.1505200541090.3204@skynet.skynet.ie>
References: <20150520130828.4fdacf54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150520130828.4fdacf54@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org


> Hi Dave,
> 
> After merging the drm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c: In function 'create_queue_cpsch':
> drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:888:2: error: implicit declaration of function 'init_sdma_vm' [-Werror=implicit-function-declaration]
>   init_sdma_vm(dqm, q, qpd);
>   ^
> 
> Caused by commit 3e3f6e1a90a8 ("drm/amdkfd: make the sdma vm init to be
> asic specific").
> 
> I have used the drm tree from next-20150519 for today.

Okay this looks like a silent conflict, I'll have to pull Linus tree into
drm-next and fix it up there.

Dave.
