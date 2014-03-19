From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: pull request: iwlwifi 2014-03-19
Date: Wed, 19 Mar 2014 15:15:04 -0400
Message-ID: <20140319191504.GB3355@tuxdriver.com>
References: <532939A0.9000901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <532939A0.9000901@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Grumbach <egrumbach@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 19, 2014 at 08:30:56AM +0200, Emmanuel Grumbach wrote:
> Hi John,
> 
> This fixes the build failure faced by Stephen:
> 
> drivers/net/wireless/iwlwifi/mvm/debugfs.c: In function 'iwl_dbgfs_fw_error_dump_release':
> drivers/net/wireless/iwlwifi/mvm/debugfs.c:161:2: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
>   vfree(file->private_data);
>   ^
> 
> Please pull.
> 
> 
> The following changes since commit a82dda6cd492b8c88952be6f6527f3656f7ac585:
> 
>   iwlwifi: mvm: disable uAPSD due to bugs in the firmware (2014-03-18 21:15:42 +0200)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git for-john
> 
> for you to fetch changes up to 192c80a2499cf2571924081c646262036d841484:
> 
>   iwlwifi: mvm: add missing include (2014-03-19 08:25:05 +0200)

Pulling now...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
