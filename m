From: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Subject: RE: linux-next: build failure after merge of the final tree
 (wireless-next tree related)
Date: Wed, 19 Mar 2014 06:23:55 +0000
Message-ID: <0BA3FCBA62E2DC44AF3030971E174FB303DB4940@HASMSX103.ger.corp.intel.com>
References: <20140319172035.b4e7c4043b486d8eeaa0534a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:52880 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755261AbaCSGYo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Mar 2014 02:24:44 -0400
In-Reply-To: <20140319172035.b4e7c4043b486d8eeaa0534a@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> 
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> drivers/net/wireless/iwlwifi/mvm/debugfs.c: In function
> 'iwl_dbgfs_fw_error_dump_release':
> drivers/net/wireless/iwlwifi/mvm/debugfs.c:161:2: error: implicit declaration
> of function 'vfree' [-Werror=implicit-function-declaration]
>   vfree(file->private_data);
>   ^

Sorry for that - patch on the way.

> 
> Caused by commit 1bd3cbc1a0e9 ("iwlwifi: mvm: send udev event upon
> firmware error to dump logs") from the wireless-next tree.  See Rule 1
> from Documentation/SubmitChecklist.
> 
> I have reverted that commit (and commit cdb00563fe2c ("iwlwifi: mvm: BT
> Coex - add debugfs hook to set BT Tx priority") that may depend on it)
> for today.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
