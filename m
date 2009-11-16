From: Masami Hiramatsu <mhiramat@redhat.com>
Subject: [PATCH -next 2/3] x86: Show symbol name if insn decoder test failed
Date: Mon, 16 Nov 2009 18:06:24 -0500
Message-ID: <20091116230624.5250.49813.stgit@harusame>
References: <20091116230611.5250.86656.stgit@harusame>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <systemtap-return-14303-gls-systemtap=m.gmane.org@sourceware.org>
In-Reply-To: <20091116230611.5250.86656.stgit@harusame>
List-Unsubscribe: <mailto:systemtap-unsubscribe-gls-systemtap=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:systemtap-subscribe@sourceware.org>
List-Post: <mailto:systemtap@sourceware.org>
List-Help: <mailto:systemtap-help@sourceware.org>, <http://sourceware.org/lists.html#faqs>
Sender: systemtap-owner@sourceware.org
To: linux-next@vger.kernel.org
Cc: lkml <linux-kernel@vger.kernel.org>, systemtap <systemtap@sources.redhat.com>, DLE <dle-develop@lists.sourceforge.net>, Masami Hiramatsu <mhiramat@redhat.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, "H. Peter Anvin" <hpa@zytor.com>, Jim Keniston <jkenisto@us.ibm.com>
List-Id: linux-next.vger.kernel.org

Show symbol name if insn decoder test find a difference.
This will help us to find out where the issue is.

Signed-off-by: Masami Hiramatsu <mhiramat@redhat.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@xenotime.net>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Jim Keniston <jkenisto@us.ibm.com>
---

 arch/x86/tools/distill.awk    |    5 +++++
 arch/x86/tools/test_get_len.c |   10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/arch/x86/tools/distill.awk b/arch/x86/tools/distill.awk
index d433619..c13c0ee 100644
--- a/arch/x86/tools/distill.awk
+++ b/arch/x86/tools/distill.awk
@@ -15,6 +15,11 @@ BEGIN {
 	fwait_str="9b\tfwait"
 }
 
+/^ *[0-9a-f]+ <[^>]*>:/ {
+	# Symbol entry
+	printf("%s%s\n", $2, $1)
+}
+
 /^ *[0-9a-f]+:/ {
 	if (split($0, field, "\t") < 3) {
 		# This is a continuation of the same insn.
diff --git a/arch/x86/tools/test_get_len.c b/arch/x86/tools/test_get_len.c
index 5743e51..af75e07 100644
--- a/arch/x86/tools/test_get_len.c
+++ b/arch/x86/tools/test_get_len.c
@@ -110,7 +110,7 @@ static void parse_args(int argc, char **argv)
 
 int main(int argc, char **argv)
 {
-	char line[BUFSIZE];
+	char line[BUFSIZE], sym[BUFSIZE] = "<unknown>";
 	unsigned char insn_buf[16];
 	struct insn insn;
 	int insns = 0, c;
@@ -122,6 +122,12 @@ int main(int argc, char **argv)
 		int nb = 0;
 		unsigned int b;
 
+		if (line[0] == '<') {
+			/* Symbol line */
+			strcpy(sym, line);
+			continue;
+		}
+
 		insns++;
 		memset(insn_buf, 0, 16);
 		strcpy(copy, line);
@@ -145,6 +151,8 @@ int main(int argc, char **argv)
 		insn_init(&insn, insn_buf, x86_64);
 		insn_get_length(&insn);
 		if (insn.length != nb) {
+			fprintf(stderr, "Error: %s found a difference at %s\n",
+				prog, sym);
 			fprintf(stderr, "Error: %s", line);
 			fprintf(stderr, "Error: objdump says %d bytes, but "
 				"insn_get_length() says %d\n", nb,


-- 
Masami Hiramatsu

Software Engineer
Hitachi Computer Products (America), Inc.
Software Solutions Division

e-mail: mhiramat@redhat.com
