From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next broken by "ARM: S3C2440: move mach-s3c2440/* into
 mach-s3c24xx/"
Date: Thu, 8 Mar 2012 14:58:44 -0500
Message-ID: <4F590F74.2030007@windriver.com>
References: <20120308162326.GA30941@windriver.com> <20120308191207.GC7557@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:40651 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905Ab2CHT7Y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Mar 2012 14:59:24 -0500
In-Reply-To: <20120308191207.GC7557@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, kgene.kim@samsung.com, heiko@sntech.de
Cc: ben-linux@fluff.org, tiwai@suse.de, linux-next@vger.kernel.org

On 12-03-08 02:12 PM, Mark Brown wrote:
> On Thu, Mar 08, 2012 at 11:23:26AM -0500, Paul Gortmaker wrote:
>> Something bad happened in this commit (dd6f01b5cc).  It looks like
>> the moved file is truncated, causing this failure:
> 
>> http://kisskb.ellerman.id.au/kisskb/buildresult/5818815/
> 
>> I believe it came in via the fix/asoc tree.
> 
> Hrm?  What is "it" in this context, and what was your analysis here?
> Nothing in the page you're linking to above suggests something audio
> related...

The "it" was the commit in the subject, and the ID in the above text.
That was the last commit to have touched this file (via moving it).

What I took as a relation to fix/asoc was shown in the text you've
gone and deleted here in the follow up.

In any case, it does appear the file was broken before it was moved.
The offending commit is actually c1ba544f81544ed9613ad5d058968533dbcef4b2

	"ARM: S3C24XX: Fix restart on S3C2442"

It appears that a closing brace was dropped when it was integrated.

Paul.
