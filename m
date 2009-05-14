From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Next May 11 : BUG during scsi initialization
Date: Thu, 14 May 2009 14:00:51 +0530
Message-ID: <4A0BD6BB.1050600@in.ibm.com>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au>
	<4A081002.4050802@in.ibm.com>
	<20090511115233.GB8112@parisc-linux.org>
	<4A081437.7000409@in.ibm.com>
	<20090511122135.GC8112@parisc-linux.org>
	<20090512045716.GC32535@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
In-Reply-To: <20090512045716.GC32535@wotan.suse.de>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Nick Piggin <npiggin@suse.de>
Cc: linuxppc-dev@ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, Matthew Wilcox <matthew@wil.cx>
List-Id: linux-next.vger.kernel.org

Nick Piggin wrote:
> This one possibly looks like a problem with remote memory allocation
> or memory hotplug or something like that. I'll do a bit of code
> review....
Removed linux-scsi from the cc list.

I can recreate this issue with today's next tree. Nick let me know if 
you need any other
information on this. I have been able to recreate this issue consistently.

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
