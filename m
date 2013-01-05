From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2013-01-04-15-43 uploaded (aio)
Date: Sat, 05 Jan 2013 11:52:49 -0800
Message-ID: <50E88491.4060703@infradead.org>
References: <20130104234405.8750720004E@hpza10.eem.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20130104234405.8750720004E@hpza10.eem.corp.google.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Kent Overstreet <koverstreet@google.com>
List-Id: linux-next.vger.kernel.org

On 01/04/13 15:44, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2013-01-04-15-43 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.
> 


A few hundred of these warnings:

include/linux/aio.h:102:43: warning: 'return' with a value, in function returning void [enabled by default]

and these errors:

fs/aio.c:697:2: error: dereferencing pointer to incomplete type
fs/aio.c:697:2: error: dereferencing pointer to incomplete type
fs/aio.c:697:2: error: dereferencing pointer to incomplete type
fs/aio.c:707:21: error: dereferencing pointer to incomplete type
fs/aio.c:808:30: error: dereferencing pointer to incomplete type
fs/aio.c:824:40: error: dereferencing pointer to incomplete type
fs/aio.c:826:25: error: storage size of 'batch_stack' isn't known

when CONFIG_BLOCK is not enabled.

-- 
~Randy
