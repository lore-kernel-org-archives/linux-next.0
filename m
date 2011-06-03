From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Repository not clone-able via git-protocol VS. http(s)
 is fine
Date: Fri, 3 Jun 2011 11:18:19 +0200
Message-ID: <BANLkTikTDfGYyL3vTK_HmEp_8vCm-dbwcA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:51775 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752795Ab1FCJSV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jun 2011 05:18:21 -0400
Received: by qyk7 with SMTP id 7so2815129qyk.19
        for <linux-next@vger.kernel.org>; Fri, 03 Jun 2011 02:18:20 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, ftpadmin@kernel.org, ftpmaster@debian.org

Just FYI:

[1] git protocol NOPE

$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Cloning into linux-next...
fatal: protocol error: bad line length character: git:

$ git clone git://git.us.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Cloning into linux-next...
fatal: protocol error: bad line length character: git:

$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
Cloning into linux-2.6...
^Cmote: Counting objects: 1955

[2] http(s) protocol HOPE

$ git clone http://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Cloning into linux-next...
remote: Counting objects: 104

$ git clone https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Cloning into linux-next...
remote: Counting objects: 497935

- Sedat -

[1] http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=summary
