From: Oded Gabbay <oded.gabbay@amd.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Thu, 29 Jan 2015 10:21:04 +0200
Message-ID: <54C9ED70.1020803@amd.com>
References: <20150129133857.2bdbb86d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150129133857.2bdbb86d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Goz <ben.goz@amd.com>
List-Id: linux-next.vger.kernel.org



On 01/29/2015 04:38 AM, Stephen Rothwell wrote:
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/amd/amdkfd/kfd_device.c: In function 'kgd2kfd_device_init':
> drivers/gpu/drm/amd/amdkfd/kfd_device.c:193:11: error: 'max_num_of_processes' undeclared (first use in this function)
>    size += (max_num_of_processes * sizeof(struct pm4_map_process) +
>             ^
> drivers/gpu/drm/amd/amdkfd/kfd_device.c:193:11: note: each undeclared identifier is reported only once for each function it appears in
> drivers/gpu/drm/amd/amdkfd/kfd_device.c:194:26: error: 'max_num_of_queues_per_process' undeclared (first use in this function)
>     max_num_of_processes * max_num_of_queues_per_process *
>                            ^
So I think that Dave's drm-next now contains the correct code.
Will you merge it again, or do you do it daily anyway ? I fear I'm entirely 
clear with the details of the linux-next process.

	Oded
