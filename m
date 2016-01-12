From: "Zhu, Rex" <Rex.Zhu@amd.com>
Subject: RE: linux-next: build failure after merge of the drm tree
Date: Tue, 12 Jan 2016 07:48:38 +0000
Message-ID: <SN1PR12MB0672DA989377A5EC670B3960FBCA0@SN1PR12MB0672.namprd12.prod.outlook.com>
References: <20151231213124.1973e995@canb.auug.org.au>
	<20160107134403.59337b3f@canb.auug.org.au>
	<20160112095457.06457d28@canb.auug.org.au>
	<alpine.DEB.2.00.1601120030550.30844@skynet.skynet.ie>
 <20160112153509.77f8858a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160112153509.77f8858a@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
List-Id: linux-next.vger.kernel.org

Hi,

In my end, this declaration of function 'do_div'  can be founded.

In file included from ./arch/x86/include/asm/div64.h:63:0,
                 from include/linux/math64.h:5,
                 from ./arch/x86/include/asm/processor.h:30,
                 from ./arch/x86/include/asm/atomic.h:6,
                 from include/linux/atomic.h:4,
                 from include/linux/mutex.h:18,
                 from include/linux/seq_file.h:7,
                 from drivers/gpu/drm/amd/powerplay/inc/hwmgr.h:26,
                 from drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/tonga_thermal.h:27,
                 from drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/tonga_thermal.c:24:
drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/tonga_thermal.c: In function 'tonga_fan_ctrl_get_fan_speed_info'


So I will add  "#include <asm/div64.h>" to fix the warning.


Best Regards
Rex
-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au] 
Sent: Tuesday, January 12, 2016 12:35 PM
To: Dave Airlie
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Zhu, Rex; Deucher, Alexander
Subject: Re: linux-next: build failure after merge of the drm tree

Hi Dave,

[This time keeping cc's]

On Tue, 12 Jan 2016 00:31:17 +0000 (GMT) Dave Airlie <airlied@linux.ie> wrote:
>
> > 
> > Did this get fixed in some non-obvious way?
> >   
> 
> I don't think so, I just applied it as is.

/me refetches the drm tree

Ah, there it is! :-)

Thanks.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
