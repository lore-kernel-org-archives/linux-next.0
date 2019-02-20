From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Wed, 20 Feb 2019 12:25:48 -0800 (PST)
Message-ID: <20190220.122548.2257661716734858013.davem@davemloft.net>
References: <20190220083611.GJ3080@nanopsycho>
        <20190220.110201.2245447687492293995.davem@davemloft.net>
        <20190220205910.7bd7fd40@redhat.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220205910.7bd7fd40@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sbrivio@redhat.com
Cc: jiri@resnulli.us, vkoul@kernel.org, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch
List-Id: linux-next.vger.kernel.org

From: Stefano Brivio <sbrivio@redhat.com>
Date: Wed, 20 Feb 2019 20:59:10 +0100

> On Wed, 20 Feb 2019 11:02:01 -0800 (PST)
> David Miller <davem@davemloft.net> wrote:
> 
>> From: Jiri Pirko <jiri@resnulli.us>
>> Date: Wed, 20 Feb 2019 09:36:11 +0100
>> 
>> > Would be good to have some robot checking "Fixes" sanity...  
>> 
>> I want to add a script to my trees that locally do it for me but the
>> backlog for patch review for me is so huge that I never get to "fun"
>> tasks like that....
> 
> If it helps, this is what I use after being bitten once:

Awesome, thanks!  You put this in as a pre-commit script?
