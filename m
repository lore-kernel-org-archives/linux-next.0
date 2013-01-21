From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the security tree with Linus' tree
Date: Sun, 20 Jan 2013 22:10:23 -0500
Message-ID: <1358737823.2406.114.camel@falcor1.watson.ibm.com>
References: <20130121131230.9f79cf5dcd8a8ac069594111@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:43934 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752638Ab3AUDK3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 20 Jan 2013 22:10:29 -0500
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zohar@linux.vnet.ibm.com>;
	Sun, 20 Jan 2013 20:10:29 -0700
In-Reply-To: <20130121131230.9f79cf5dcd8a8ac069594111@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@intel.com>

On Mon, 2013-01-21 at 13:12 +1100, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next merge of the security tree got a conflict in
> security/integrity/ima/ima_main.c between commit a7f2a366f623 ("ima:
> fallback to MODULE_SIG_ENFORCE for existing kernel module syscall") from
> Linus' tree and commit 750943a30714 ("ima: remove enforce checking
> duplication") from the security tree.
> 
> I think I fixed it up (see below).

Sorry Stephen, the merged result should look like what's contained in
linux-integrity/next-upstreamed-patches:

int ima_module_check(struct file *file)
{
        if (!file) {
                if ((ima_appraise & IMA_APPRAISE_MODULES) &&
                    (ima_appraise & IMA_APPRAISE_ENFORCE)) {
#ifndef CONFIG_MODULE_SIG_FORCE
                        return -EACCES; /* INTEGRITY_UNKNOWN */
#endif
                }
                return 0;
        }
        return process_measurement(file, file->f_dentry->d_name.name,
                                   MAY_EXEC, MODULE_CHECK);
}

thanks,

Mimi
