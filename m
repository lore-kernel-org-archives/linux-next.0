From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] virtio_net: Cleanup command queue scatterlist usage
Date: Fri, 01 May 2009 15:52:59 -0700 (PDT)
Message-ID: <20090501.155259.185618790.davem@davemloft.net>
References: <20090427154925.4771.63651.stgit@debian.lart>
	<20090501.153301.42015656.davem@davemloft.net>
	<1241217794.9646.588.camel@2710p.home>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1241217794.9646.588.camel@2710p.home>
Sender: netdev-owner@vger.kernel.org
To: alex.williamson@hp.com
Cc: rusty@rustcorp.com.au, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Alex Williamson <alex.williamson@hp.com>
Date: Fri, 01 May 2009 16:43:14 -0600

> On Fri, 2009-05-01 at 15:33 -0700, David Miller wrote:
>> From: Alex Williamson <alex.williamson@hp.com>
>> Date: Mon, 27 Apr 2009 09:50:03 -0600
>> 
>> > We were avoiding calling sg_init* on scatterlists passed
>> > into virtnet_send_command to prevent extraneous end markers.
>> > This caused build warnings for uninitialized variables.
>> > Cleanup the code to create proper scatterlists.
>> > 
>> > Signed-off-by: Alex Williamson <alex.williamson@hp.com>
>> 
>> This patch does not apply even to Linus's current tree.
> 
> It was against net-next-2.6.git, I'll update it for linux-2.6.git.
> IIRC, it applied with some fuzz.

Thanks.  I want to apply this to net-2.6 to fix those uninitialed
scatterlist structure issues.
