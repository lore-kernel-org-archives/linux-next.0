From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH -mm] elf: fixup compilation
Date: Tue, 5 Feb 2019 09:43:34 +0300
Message-ID: <20190205064334.GA2152@avx2>
References: <20190205014806.rQcAx%akpm@linux-foundation.org>
 <08a894b1-66f6-19bf-67be-c9b7b1b01126@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <08a894b1-66f6-19bf-67be-c9b7b1b01126@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

	fold into elf-use-list_for_each_entry.patch

 fs/binfmt_elf.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2110,8 +2110,8 @@ static int write_note_info(struct elf_note_info *info,
 
 	/* write out the thread status notes section */
 	list_for_each_entry(ets, &info->thread_list, list) {
-		for (i = 0; i < tmp->num_notes; i++)
-			if (!writenote(&tmp->notes[i], cprm))
+		for (i = 0; i < ets->num_notes; i++)
+			if (!writenote(&ets->notes[i], cprm))
 				return 0;
 	}
 
