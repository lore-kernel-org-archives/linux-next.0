From: ebiederm@xmission.com (Eric W. Biederman)
Subject: [PATCH] kbuild: all{no,yes,mod,def,rand}config only read files when instructed to.
Date: Mon, 07 May 2012 05:37:45 -0700
Message-ID: <m11umwjheu.fsf@fess.ebiederm.org>
References: <20120507170319.03aa2fe980a39669c393a956@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:43771 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756268Ab2EGMdd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 May 2012 08:33:33 -0400
In-Reply-To: <20120507170319.03aa2fe980a39669c393a956@canb.auug.org.au>
	(Stephen Rothwell's message of "Mon, 7 May 2012 17:03:19 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>


Prevent subtle surprises to both people working on the kconfig code
and people using make allnoconfig allyesconfig allmoconfig and
randconfig by only attempting to read a config file if
KCONFIG_ALLCONFIG is set.

Common sense suggests attempting to read the extra config files does
not make sense unless requested.  The documentation says the code
won't attempt to read the extra config files unless requested.
Current usage does not appear to include people depending on the code
reading the config files without the variable being set So do the
simple thing and stop reading config files when passed
all{no,yes,mod,def,rand}config unless KCONFIG_ALLCONFIG environment
variable is set.

Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---
 scripts/kconfig/conf.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 0fdda91..0dc4a2c 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -574,7 +574,9 @@ int main(int ac, char **av)
 	case alldefconfig:
 	case randconfig:
 		name = getenv("KCONFIG_ALLCONFIG");
-		if (name && (strcmp(name, "") != 0) && (strcmp(name, "1") != 0)) {
+		if (!name)
+			break;
+		if ((strcmp(name, "") != 0) && (strcmp(name, "1") != 0)) {
 			if (conf_read_simple(name, S_DEF_USER)) {
 				fprintf(stderr,
 					_("*** Can't read seed configuration \"%s\"!\n"),
-- 
1.7.2.5
