From: Pat Erley <pat-lkml@erley.org>
Subject: Possible regression after 3935ed6a3a533c1736e3ca65bff72afd1773be27
Date: Wed, 26 Mar 2014 00:36:50 -0500
Message-ID: <53326772.4000900@erley.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from erley.org ([97.107.129.9]:57643 "EHLO remote.erley.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750832AbaCZFp2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Mar 2014 01:45:28 -0400
Received: from [192.168.1.102] (162-230-90-164.lightspeed.mdsnwi.sbcglobal.net [162.230.90.164])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by remote.erley.org (Postfix) with ESMTPSA id 215962801D
	for <linux-next@vger.kernel.org>; Wed, 26 Mar 2014 05:36:51 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

On my 64bit kernel,  some commit after 
3935ed6a3a533c1736e3ca65bff72afd1773be27 seems to have broken 32bit 
compatibility.  I've run the bisection twice, and both pointed to 
0df1ea2b7955d3cb311a549c44ed482452b859ff, but reverting that on HEAD did 
not solve the problem.

Even this simple program:

main(){puts("HELLO");}

compiled with:

gcc -m32 test.c

Will crash with the infinitely unhelpful:

$ ./a.out
Killed

Even strace doesn't point to why it's failing:

$ strace ./a.out
execve("./a.out", ["./a.out"], [/* 73 vars */] <unfinished ...>
+++ killed by SIGKILL +++
Killed

I wasn't sure how to proceed with finding which further commits might be 
causing issues, so I traced it back to the last working.  .config 
available by request.  I'll happily test fixes/further reverts.

Pat Erley
