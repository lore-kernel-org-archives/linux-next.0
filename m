From: "Stoyan Gaydarov" <stoyboyker@gmail.com>
Subject: Linux-next testing
Date: Wed, 16 Jul 2008 06:27:27 -0500
Message-ID: <6d291e080807160427o5a853ca8u96841a2717901a8d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.189]:29531 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753498AbYGPL13 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Jul 2008 07:27:29 -0400
Received: by nf-out-0910.google.com with SMTP id d3so1804521nfc.21
        for <linux-next@vger.kernel.org>; Wed, 16 Jul 2008 04:27:27 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

I have a box that I would like to devote to test the linux-next
kernels. I am however not very experienced with the whole process. I
installed a clean Ubuntu server on it because thats what I had at
home, I know how to compile the kernel, and install(make; make
modules; make install) I also know how to log the build so that if
theres any errors i can have a record of what went wrong. What I need
help is knowing what to test and getting reports back to you. I know I
can do a 'git clone "path to linux-next git tree" ' and go into that
and use randconfig then install and reboot, but I was wondering if
there was some other better way to do it because the clone command
only works in an empty directory. I think fetch or something like that
might work better. Anyway I also wanted to know which configuration
needed the most testing or if I should just stick with the
randconfig(btw this is an x86 box). The other question is about
reporting failures, which i can almost guarantee will happen, one way
is to keep a vanilla kernel installed so that i can aways go back to
it and report the log files but if its a oops or a BUG() call i am not
sure they get reported there... The last question I have is regarding
the load on the box, this is not a very new box so I cant run too many
things at once but I would like to know if there is anything I should
be running on the box while it is running that way it can stress the
system a little and try to break it in a way that can be useful.
Looking back at what I wrote, those are not quite questions but I
think you get the idea, I just need some information on what to do so
that I can be of use to the people that are developing with
linux-next.

-Stoyan G
