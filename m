From: David Miller <davem@davemloft.net>
Subject: Re: mmotm 2014-09-22-16-57 uploaded
Date: Wed, 24 Sep 2014 02:24:10 -0400 (EDT)
Message-ID: <20140924.022410.1707532643268164791.davem@davemloft.net>
References: <5421E7E1.80203@infradead.org>
	<20140923215356.GA15481@roeck-us.net>
	<20140924043423.GA28993@roeck-us.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20140924043423.GA28993@roeck-us.net>
Sender: owner-linux-mm@kvack.org
To: linux@roeck-us.net
Cc: rdunlap@infradead.org, akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz
List-Id: linux-next.vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 23 Sep 2014 21:34:23 -0700

> On Tue, Sep 23, 2014 at 02:53:56PM -0700, Guenter Roeck wrote:
>> 
>> > Neither of these patches enables CONFIG_NET.  They just add dependencies.
>> > 
>> This means CONFIG_NET is now disabled in at least 31 configurations where
>> it used to be enabled before (per my count), and there may be additional
>> impact due to the additional changes of "select X" to "depends on X".
>> 
>> 3.18 is going to be interesting.
>> 
> Actually, turns out the changes are already in 3.17.
> 
> In case anyone is interested, here is a list of now broken configurations
> (where 'broken' is defined as "CONFIG NET used to be defined, but
> is not defined anymore"). No guarantee for completeness or correctness.

I'll sort this out completely tomorrow.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
