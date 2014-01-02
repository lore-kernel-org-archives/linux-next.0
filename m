From: Pat Erley <pat-lkml@erley.org>
Subject: Possible regression from "fs/exec.c: call arch_pick_mmap_layout()
 only once"
Date: Thu, 02 Jan 2014 15:41:27 -0600
Message-ID: <52C5DD07.40208@erley.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from erley.org ([97.107.129.9]:52115 "EHLO remote.erley.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752028AbaABVvD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jan 2014 16:51:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: richard@nod.at

On my 64bit kernel, commit 283fe963095b38a6ab75dda1436ee66b9e45c7c2 
seems to have broken 32bit compatibility.  I've run the bisection twice, 
and verified that reverting this on HEAD fixes the problem.  I've 
uploaded my .config to pastebin at http://pastebin.com/kVcr9H65

Even this simple program:

main(){puts("HELLO");}

compiled with:

gcc -m32 test.c

Will crash with a segfault.  Stracing shows that it's failing to 
allocate memory.

Pat Erley
