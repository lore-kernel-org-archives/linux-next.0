From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: LATEST-IS naming
Date: Thu, 15 May 2008 15:03:54 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0805151457570.16405@shark.he.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:52708 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751350AbYEOWED (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 May 2008 18:04:03 -0400
Received: from shark.he.net ([66.160.160.2]) by xenotime.net for <linux-next@vger.kernel.org>; Thu, 15 May 2008 15:03:54 -0700
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi Stephen,

With the patch-vXYZ-next-datestamp.{gz,bz2} naming, having a file
named LATEST-IS-next-datestamp doesn't help scripts fill in the
vXYZ part of the patch filename.  Would it be possible/feasible
for the LATEST-IS file to have content to tell what the patch
file applies to, like:
v2.6.26-rc2

or just the full vXYZ[-rc] info in the LATEST-IS filename.

If not, do you have other suggestions/preferences?

Obviously I can get around this problem, but some direct version-datestamp
info would be helpful.

-- 
~Randy
