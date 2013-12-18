From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: build warning after merge of the target-updates tree
Date: Wed, 18 Dec 2013 15:59:30 -0800
Message-ID: <1387411170.5567.3.camel@haakon3.risingtidesystems.com>
References: <20131218173930.56f758971ca1939cbc3e67ec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <target-devel-owner@vger.kernel.org>
In-Reply-To: <20131218173930.56f758971ca1939cbc3e67ec@canb.auug.org.au>
Sender: target-devel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>, target-devel <target-devel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Wed, 2013-12-18 at 17:39 +1100, Stephen Rothwell wrote:
> Hi Nicholas,
> 
> After merging the target-updates tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/target/target_core_alua.c: In function 'core_alua_state_lba_dependent':
> drivers/target/target_core_alua.c:473:6: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Wparentheses]
>   if (!cmd->se_cmd_flags & SCF_SCSI_DATA_CDB)
>       ^
> 
> Introduced by commit 923aacab87ba ("target_core_alua: Referrals
> infrastructure").

Fixed for today's linux-next tree.

Thank you,

--nab
