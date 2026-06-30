# IntelliJ IDEA IDE Configuration Fix

## Steps to Fix "package org.springframework.context does not exist" Error

### Option 1: Manual Refresh in IntelliJ IDEA (Recommended)

1. **Close the project** in IntelliJ IDEA
   - File → Close Project

2. **Delete IntelliJ Cache**
   - Delete the entire `.idea` folder from your project
   - Delete the `2.iml` file

3. **Reopen the project**
   - File → Open → Select `C:\Users\renu_\IdeaProjects\2`
   - Let IntelliJ recreate the project structure

4. **Add Libraries to Project**
   - Go to `File → Project Structure` (Ctrl+Alt+Shift+S)
   - Select `Libraries` → Click `+` → `Java`
   - Select all JAR files from `lib` folder:
     - `spring-core-5.3.18.jar`
     - `spring-context-5.3.18.jar`
     - `spring-beans-5.3.18.jar`
     - `spring-jcl-5.3.18.jar`
     - `spring-aop-5.3.18.jar`
     - `spring-expression-5.3.18.jar`

5. **Add Libraries to Module**
   - Go to `File → Project Structure` → `Modules` → Select `2` module
   - Go to `Dependencies` tab
   - Click `+` → `Library` → Select all Spring libraries you just created
   - Click `OK`

6. **Rebuild Project**
   - Build → Rebuild Project
   - Or press Ctrl+F9

### Option 2: Automatic Configuration (Already Applied)

The following files have been updated:
- `.idea/libraries.xml` - Defines all Spring library locations
- `2.iml` - Contains module-level library references with absolute paths

**To apply this automatically:**
1. Restart IntelliJ IDEA
2. File → Invalidate Caches
3. Select "Invalidate and Restart"

### Verification

After following either option, verify:
1. No red squiggly lines under Spring imports in Main.java
2. Main.java compiles without errors
3. Build → Rebuild Project succeeds

### If Still Not Working

1. Check that all JAR files exist in `C:\Users\renu_\IdeaProjects\2\lib\`
2. Verify Java SDK is configured:
   - File → Project Structure → Project SDK
   - Should show Java 11 or higher
3. Try File → Invalidate Caches → Invalidate and Restart
