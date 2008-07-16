From: Kyle Spaans <kspaans@student.math.uwaterloo.ca>
Subject: Re: Linux-next testing
Date: Wed, 16 Jul 2008 10:43:16 -0400
Message-ID: <20080716144316.GA26366@student.math>
References: <6d291e080807160427o5a853ca8u96841a2717901a8d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from services05.student.math.uwaterloo.ca ([129.97.204.15]:64017
	"EHLO services05.student.math.uwaterloo.ca" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753778AbYGPPCe (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 11:02:34 -0400
Received: from student.math.uwaterloo.ca (daemon@student.math.uwaterloo.ca [129.97.204.16])
	by services05.student.math.uwaterloo.ca (8.13.8/8.13.8) with ESMTP id m6GEhHmw004686
	for <linux-next@vger.kernel.org>; Wed, 16 Jul 2008 10:43:18 -0400 (EDT)
Received: (from kspaans@localhost)
	by student.math.uwaterloo.ca (8.13.4/8.13.4) id m6GEhGaB027224
	for linux-next@vger.kernel.org; Wed, 16 Jul 2008 10:43:16 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <6d291e080807160427o5a853ca8u96841a2717901a8d@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

On Wed, Jul 16, 2008 at 06:27:27AM -0500, Stoyan Gaydarov wrote:
> I know I
> can do a 'git clone "path to linux-next git tree" ' and go into that
> and use randconfig then install and reboot, but I was wondering if
> there was some other better way to do it because the clone command
> only works in an empty directory. I think fetch or something like that
> might work better.
Have a look in the archives for this list. Every time Stephen announces a new linux-next release, he includes a blurb at the bottom of the email that will tell you how you can get the linux-next tree, besides just cloning it anew each day. (I found that blurb helpful even on top of the wiki at http://linux.f-seidel.de/linux-next/pmwiki/)

> The last question I have is ... stress the system a little and try to
>  break it in a way that can be useful.
Look around on the linux-next wiki, and you'll see that other people are running automated testing. Have a look at how they are doing it. Also look around on the kernelnewbies.org website, they have tips for how to stress-test your system. (bonnie++ as a filesystem benchmark springs immediately to mind, prime95 as a way to generate cpu load, etc...). I'm sure a quick internet search for "linux stress test" will also turn up useful results.

I'm largely doing the same thing as you, so I'll be interested to see the answers to your other questions.

gl & hf
