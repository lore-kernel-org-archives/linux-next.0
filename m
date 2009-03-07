From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] dvb/frontends: fix duplicate 'debug' symbol
Date: Fri, 06 Mar 2009 16:05:02 -0800
Message-ID: <49B1BA2E.8000406@oracle.com>
References: <20090306191311.697e7b97.sfr@canb.auug.org.au>	<49B1949E.2000300@oracle.com> <20090306155958.11b4a186.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20090306155958.11b4a186.akpm@linux-foundation.org>
Sender: linux-media-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@infradead.org, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

Andrew Morton wrote:
> On Fri, 06 Mar 2009 13:24:46 -0800
> Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 
>> It would also be Good if arch/x86/kernel/entry_32.S didn't have a
>> non-static 'debug' symbol.  OTOH, it helps catch things like this one.
> 
> heh, yes, it's a feature.  We should put it in init/main.c, along with
> 100-odd other dont-do-that-dopey symbols.

hm, I think I'll leave that patch for you or Ingo. ;)

-- 
~Randy
